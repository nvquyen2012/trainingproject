package com.example.auth.mapper;

import com.example.trainingbase.dto.UserDto;
import com.example.trainingbase.entity.new_auth.User;
import com.example.trainingbase.mapper.EntityMapper;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring")
public interface UserMapper extends EntityMapper<User, UserDto> {
    
    @Override
    @Mapping(target = "id")
    User toEntity(UserDto dto);

    @Override
    @Mapping(target = "id")
    UserDto toDTO(User model);

    @Override
    List<UserDto> toDTOList(List<User> listEntity);
}
