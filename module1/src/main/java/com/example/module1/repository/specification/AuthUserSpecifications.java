package com.example.module1.repository.specification;

import com.example.module1.repository.UserRepository;
import com.example.trainingbase.constants.HttpStatusConstants;
import com.example.trainingbase.entity.auth.AuthUser;
import com.example.trainingbase.exceptions.BusinessException;
import lombok.AllArgsConstructor;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.ArrayList;
import java.util.List;

import static org.springframework.data.jpa.domain.Specification.where;

@Repository
@AllArgsConstructor
public class AuthUserSpecifications {
    private final UserRepository userRepository;
    public static Specification<AuthUser> createSpecification(FilterInfo input){
        switch(input.getOperator()){
            case "EQUALS":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.equal(
                                root.get(input.getField()),
                                castToRequiredType(root.get(input.getField()).getJavaType(),
                                        input.getValue()));
            case "NOT_EQUALS":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.notEqual(
                                root.get(input.getField()),
                                castToRequiredType(root.get(input.getField()).getJavaType(),
                                        input.getValue()));
            case "GREATER_THAN":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.gt(
                                root.get(input.getField()),
                                (Number) castToRequiredType(root.get(input.getField()).getJavaType(),
                                        input.getValue()));
            case "LESS_THAN":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.lt(
                                root.get(input.getField()),
                                (Number) castToRequiredType(root.get(input.getField()).getJavaType(),
                                        input.getValue()));
            case "LIKE":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.like(
                                root.get(input.getField()),input.getValue());
            case "IN":
                return (root, query, criteriaBuilder) ->
                        criteriaBuilder.in(
                                root.get(input.getField())).value(
                                        castToRequiredType(root.get(input.getField()).getJavaType(), input.getValues()));
            default:
                throw new BusinessException(HttpStatusConstants.FAILURE_CODE, "Failed specifications. Operations not supported");
        }
    }

    public List<AuthUser> getQueryResult(List<FilterInfo> filter){
        if(filter.size()>0){
            return userRepository.findAll(getSpecificationFromFilters(filter));
        } else {
            return userRepository.findAll();
        }
    }

    private static Specification<AuthUser> getSpecificationFromFilters(List<FilterInfo> filter){
        Specification<AuthUser> specification = where(createSpecification(filter.remove(0)));
        for(FilterInfo input : filter){
            specification = specification.and(createSpecification(input));
        }
        return specification;
    }

    private static Object castToRequiredType(Class fieldType, String value){
        if(fieldType.isAssignableFrom(Double.class)){
            return Double.valueOf(value);
        } else if(fieldType.isAssignableFrom(Integer.class)){
            return Integer.valueOf(value);
        } else if(Enum.class.isAssignableFrom(fieldType)){
            return Enum.valueOf(fieldType, value);
        }
        return value;
    }

    private static Object castToRequiredType(Class fieldType, List<String> value){
        List<Object> lists = new ArrayList<>();
        for(String s : value){
            lists.add(castToRequiredType(fieldType,s));
        }
        return lists;
    }
}
