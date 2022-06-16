package com.example.auth.model;

import lombok.*;

import java.io.Serializable;

@Data
public class DefaultResponse<E> implements Serializable{

  private static final long serialVersionUID = 1L;

  private String message;

  private E data;
}
