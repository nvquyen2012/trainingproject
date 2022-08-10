package com.example.trainingbase.config;

import com.example.trainingbase.entity.AbstractEntity;
import com.example.trainingbase.service.AuditorAwareImpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import java.util.Date;

@Configuration
@ComponentScan({"com.example.trainingbase.interceptor"})
@PropertySource(value = {"classpath:application.properties"})
@EnableJpaAuditing(auditorAwareRef="auditorAware")
@EnableTransactionManagement
public class EnableCommonConfig {

    @Bean
    public ObjectMapper initObjectMapper(){
        return new ObjectMapper();
    }

    @PrePersist
    public void touchForCreate(AbstractEntity target) {
        Date now = new Date();
        target.setCreatedAt(now);
        target.setUpdatedAt(now);
    }

    @PreUpdate
    public void touchForUpdate(AbstractEntity target) {
        target.setUpdatedAt(new Date());
    }

    @Bean
    AuditorAware<Long> auditorAware(){
        return new AuditorAwareImpl();
    }
}
