package com.example.trainingbase.dto;

import java.util.Date;
import java.util.List;

public class TrainingUserDto {

    private Long id;

    private Long createdBy;

    private Date createdDate;

    private Long updatedBy;

    private Date updatedDate;

    private List<RoleDTO> roleDTOList;
}
