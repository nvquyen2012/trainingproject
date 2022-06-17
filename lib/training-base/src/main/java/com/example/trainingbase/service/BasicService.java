package com.example.trainingbase.service;

import com.example.trainingbase.dto.BasicDTO;
import com.example.trainingbase.entity.AbstractEntity;
import com.example.trainingbase.payload.BasePageRequest;
import com.example.trainingbase.repository.BasicRepository;
import org.springframework.data.domain.Page;

public interface BasicService<T extends AbstractEntity, E extends BasicDTO> {

    E create(E model);

    E  update(E  model);

    E  getOne(E model);

    Page<E> get(BasePageRequest request);

    void delete(Long id);

    void setBasicRepository(BasicRepository<T> basicRepository);

}
