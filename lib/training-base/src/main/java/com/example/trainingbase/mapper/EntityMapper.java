package com.example.trainingbase.mapper;

import com.example.trainingbase.dto.BasicDTO;
import com.example.trainingbase.entity.AbstractEntity;

import java.util.List;

public interface EntityMapper<T extends AbstractEntity, E extends BasicDTO> {

    T toEntity(E dto);

    E toDTO(T model);

    List<E> toDTOList(List<T> listEntity);
}
