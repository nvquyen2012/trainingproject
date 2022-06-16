package com.example.trainingbase.service;

import com.example.trainingbase.entity.AbstractEntity;
import com.example.trainingbase.payload.PageRequest;
import org.springframework.data.domain.Page;

public interface BasicService<T extends AbstractEntity> {

    T create(T model);

    T update(T model);

    T getOne(Long id);

    Page<T> get(PageRequest request);

    T delete(Long id);

}
