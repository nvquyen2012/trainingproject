package com.example.auth.controller;

import com.example.auth.model.DefaultResponse;
import com.example.auth.model.JwtResponse;
import com.example.auth.model.SignInRequest;
import com.example.auth.model.SignUpRequest;
import com.example.trainingbase.constants.ErrorMessage;
import com.example.trainingbase.constants.SuccessMessage;
import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.enums.UserRole;
import com.example.trainingbase.exceptions.NotFoundException;
import com.example.trainingbase.security.jwt.AuthTokenFilter;
import com.example.trainingbase.security.jwt.JwtUntils;
import com.example.trainingbase.security.services.UserDetailsImpl;
import com.example.trainingbase.security.services.UserDetailsServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.crossstore.ChangeSetPersister;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Set;
import java.util.stream.Collectors;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
@Slf4j
public class AuthController {

  @Autowired
  private AuthenticationManager authenticationManager;

  @Autowired
  private UserDetailsServiceImpl userDetailsService;

  @Autowired
  private JwtUntils jwtUntils;

  @PostMapping("/signin")
  public ResponseEntity<?> authenticateUser(@Valid @RequestBody SignInRequest request) {
    log.info(request.getUsername());
    Authentication authentication = authenticationManager
        .authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword()));
    SecurityContextHolder.getContext().setAuthentication(authentication);
    String jwt = jwtUntils.generateJwtToken(authentication);
    UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
    Set<String> roles = userDetails.getAuthorities().stream().map(role -> role.getAuthority())
        .collect(Collectors.toSet());
    log.info("JWT: {}", jwt);

    UserDto userInfo = new UserDto();
    userInfo.setId(userDetails.getId());
    userInfo.setUsername(userDetails.getUsername());
    userInfo.setFullname(userDetails.getFullname());
    userInfo.setPhone(userDetails.getPhone());
    userInfo.setRoles(roles);
    userInfo.setEmail(userDetails.getEmail());
    userInfo.setStatus(userDetails.getStatus());
    userInfo.setAddress(userDetails.getAddress());
    userInfo.setProfileImagePath(userDetails.getProfileImagePath());

    JwtResponse response = new JwtResponse();
    response.setIdToken(jwt);
    response.setUserInfo(userInfo);

    HttpHeaders responseHeaders = new HttpHeaders();
    responseHeaders.set("Access-Control-Expose-Headers", "Authorization");
    responseHeaders.set("Authorization", "Bearer " + jwt);

    // Set default response body
    DefaultResponse<JwtResponse> defaultResponse = new DefaultResponse<>();
    defaultResponse.setMessage(SuccessMessage.SIGN_IN_SUCCESSFULLY);
    defaultResponse.setData(response);

    return ResponseEntity.status(HttpStatus.CREATED).headers(responseHeaders).body(defaultResponse);
  }

  @PostMapping("/signup")
  public ResponseEntity<?> registerUser(@Valid @RequestBody SignUpRequest request) {
    String role = request.getRoles().iterator().next().toUpperCase();
    if (UserRole.valueOf(role) != null) {
      UserService
      log.info("Create user with request: {}", request.toString());
    } else {
      throw new NotFoundException(ErrorMessage.ROLE_NOT_FOUND);
    }

    // Set default response body
    DefaultResponse<SupplierDto> defaultResponse = new DefaultResponse<>();
    defaultResponse.setMessage(SuccessMessage.SIGN_UP_SUCCESSFULLY);
    defaultResponse.setData(supplierDto);

    return ResponseEntity.status(HttpStatus.CREATED).body(defaultResponse);
  }

  @GetMapping("/refresh")
  public ResponseEntity<?> refreshToken(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      UsernamePasswordAuthenticationToken authentication = authUserByToken(request);
      if (authentication != null) {
        String jwtRefresh = jwtUntils.generateJwtToken(authentication);
        JwtResponse responseJwt = new JwtResponse();
        responseJwt.setIdToken(jwtRefresh);

        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Access-Control-Expose-Headers", "Authorization");
        responseHeaders.set("Authorization", "Bearer " + jwtRefresh);
        return ResponseEntity.ok().headers(responseHeaders).body(responseJwt);
      }
    } catch (Exception e) {
      log.error("Cannot set user authentication: {}", e);
    }
    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Cannot authenticate this JWT");
  }

  @GetMapping("/user")
  public ResponseEntity<?> fetchUser(HttpServletRequest request, HttpServletResponse response) {
    try {
      String jwt = AuthTokenFilter.parseJwt(request);
      UsernamePasswordAuthenticationToken authentication = authUserByToken(request);
      if (authentication != null) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        Set<String> roles = userDetails.getAuthorities().stream().map(role -> role.getAuthority())
            .collect(Collectors.toSet());

        UserDto userInfo = new UserDto();
        userInfo.setId(userDetails.getId());
        userInfo.setUsername(userDetails.getUsername());
        userInfo.setFullname(userDetails.getFullname());
        userInfo.setPhone(userDetails.getPhone());
        userInfo.setRoles(roles);
        userInfo.setEmail(userDetails.getEmail());
        userInfo.setStatus(userDetails.getStatus());
        userInfo.setAddress(userDetails.getAddress());
        userInfo.setProfileImagePath(userDetails.getProfileImagePath());

        JwtResponse responseJwt = new JwtResponse();
        responseJwt.setIdToken(jwt);
        responseJwt.setUserInfo(userInfo);

        return ResponseEntity.ok().body(responseJwt);
      }
    } catch (Exception e) {
      log.error("Cannot set user authentication: {}", e);
    }
    return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Cannot authenticate this JWT");
  }

  private UsernamePasswordAuthenticationToken authUserByToken(HttpServletRequest request)
      throws ServletException, IOException {
    try {
      log.info("doFilterInternal {}", request.getHeader("Authorization"));
      String jwt = AuthTokenFilter.parseJwt(request);
      if (jwt != null && jwtUntils.validateJwtToken(jwt) != null) {
        String username = jwtUntils.getUsernameFromJwtToken(jwt);
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetails, null,
            userDetails.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return authentication;
      }
    } catch (Exception e) {
      log.error("Cannot set user authentication: {}", e);
    }
    return null;
  }

}
