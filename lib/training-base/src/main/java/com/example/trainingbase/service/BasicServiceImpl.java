package com.example.trainingbase.service;

import com.example.trainingbase.dto.BasicDTO;
import com.example.trainingbase.entity.AbstractEntity;
import com.example.trainingbase.mapper.EntityMapper;
import com.example.trainingbase.payload.BasePageRequest;
import com.example.trainingbase.repository.BasicRepository;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.Optional;

public class BasicServiceImpl<T extends AbstractEntity, E extends BasicDTO> implements BasicService<T, E> {

    private BasicRepository<T> basicRepository;

    private EntityMapper<T, E> entityMapper;

    private ExampleMatcher caseInsensitiveExampleMatcher = ExampleMatcher.matching().withIgnoreCase();

    public BasicServiceImpl(BasicRepository<T> basicRepository) {
        this.basicRepository = basicRepository;
    }

    public BasicRepository<T> getBasicRepository(){
        return this.basicRepository;
    }

    public void setBasicRepository(BasicRepository<T> basicRepository) {
        this.basicRepository = basicRepository;
    }

    @Override
    public E create(E model) {
        if (model == null) {
            return null;
        }
        return entityMapper.toDTO(basicRepository.saveAndFlush(entityMapper.toEntity(model)));
    }

    @Override
    public E update(E model) {
        if (model == null) {
            return null;
        }
        return entityMapper.toDTO(basicRepository.save(entityMapper.toEntity(model)));
    }

    @Override
    public E getOne(E model) {
        Example<T> example = Example.of(entityMapper.toEntity(model), caseInsensitiveExampleMatcher);
        Optional<T> entityOptional = basicRepository.findOne(example);

        if(entityOptional.isPresent()) {
            return entityMapper.toDTO(entityOptional.get());
        }
        return null;
    }

    @Override
    public Page get(BasePageRequest request) {
        PageRequest pageRequest = PageRequest.of(request.getPage(), request.getSize());
        return basicRepository.findAll(pageRequest);
    }

    @Override
    public void delete(Long id) {
        basicRepository.deleteById(id);
    }
}
