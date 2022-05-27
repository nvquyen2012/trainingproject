package com.example.module1.service.impl;

import com.example.module1.model.RegisterUserInfo;
import com.example.module1.repository.UserRepository;
import com.example.module1.service.UserService;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.entity.auth.ERoles;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@AllArgsConstructor
public class UserDetailsServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email).orElseThrow(() ->
                new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE, HttpStatusConstants.EMAIL_NOT_EXISTS_MESSAGE));
    }

//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        AuthUser authUser = userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException(STATUS_NOT_OK));
//        return User.builder()
//                .username(authUser.getEmail())
//                .password(authUser.getPassword())
//                .authorities(AuthorityUtils.createAuthorityList(authUser.getRole()))
//                .build();
//    }
    @Override
    public String signUpUser(AuthUser authUser){
        boolean userExisted = userRepository.findByEmail(authUser.getEmail()).isPresent();
        if(userExisted){
            throw new BusinessException(HttpStatusConstants.EMAIL_EXIST_CODE,
                                        HttpStatusConstants.EMAIL_EXIST_MESSAGE);
        }
        String encodedPassword = bCryptPasswordEncoder.encode(authUser.getPassword());
        authUser.setPassword(encodedPassword);
        authUser.setStatus(EStatus.PENDING.name());
//        authUser.setAuthorities(ERoles.SALE_RM);
        userRepository.save(authUser);
        //TODO: send confirmation token
        return "";
    }

    @Override
    public AuthUser findById(Integer Id){
        AuthUser authUser = userRepository.findById(Id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        return authUser;
    }
    @Override
    public AuthUser findByEmail(String email) {
        AuthUser authUser = userRepository.findByEmail(email).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE, HttpStatusConstants.EMAIL_NOT_EXISTS_MESSAGE)
        );
        return authUser;
    }

    @Override
    public AuthUser findByCompanyId(Integer companyId) {
        AuthUser authUser = userRepository.findByCompanyId(companyId).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.COMPANY_NOT_EXISTED_CODE, HttpStatusConstants.COMPANY_NOT_EXISTED_MESSAGE)
        );
        return authUser;
    }

    @Override
    public void deleteById(Integer id) {
        userRepository.deleteById(id);
    }

    @Override
    public void deleteByEmail(String email) {
        userRepository.deleteByEmail(email);
    }
    @Override
    @Transactional
    public void updateUserById(Integer id, RegisterUserInfo registerUserInfo) {
        AuthUser temp = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        temp.setEmail(registerUserInfo.getEmail());
        temp.setPhoneNumber(registerUserInfo.getPhoneNumber());
        temp.setFullName(registerUserInfo.getFullName());
    }

    @Override
    @Transactional
    public void updateUserRoleById(Integer id, String role) {
        AuthUser temp = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        temp.setRole(role);
    }

    @Override
    @Transactional
    public void updateUserCompanyById(Integer id, Integer companyId) {
        AuthUser temp = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        temp.setCompanyId(companyId);
    }

    @Override
    @Transactional
    public void verifyUser(Integer id, String decision) {
        AuthUser authUser = userRepository.findById(id).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.INVALID_USER_ID_CODE, HttpStatusConstants.INVALID_USER_ID_MESSAGE)
        );
        if(!authUser.getStatus().equals(EStatus.PENDING.name())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, HttpStatusConstants.STATUS_INVALID_MESSAGE);
        }
        authUser.setStatus(decision);
    }
    @Transactional
    public void verifyLogin(RegisterUserInfo request) {
        AuthUser authUser = userRepository.findByEmail(request.getEmail()).orElseThrow(
                () -> new BusinessException(HttpStatusConstants.EMAIL_NOT_EXISTS_CODE, HttpStatusConstants.EMAIL_NOT_EXISTS_MESSAGE)
        );
        if(EStatus.REJECTED.name().equals(authUser.getStatus())){
            throw new BusinessException(HttpStatusConstants.STATUS_INVALID_CODE, HttpStatusConstants.STATUS_INVALID_MESSAGE);
        }

    }
}
