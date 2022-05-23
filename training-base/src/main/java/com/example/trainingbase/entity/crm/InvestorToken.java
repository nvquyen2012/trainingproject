package com.example.trainingbase.entity.crm;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "investor_token", schema = "crm_bib")
public class InvestorToken extends AbstractEntity {

    @Id
    @Column(name = "investor_id")
    private String investorId;

    @Column(name = "token")
    private String token;

    @Column(name = "token_status")
    private String tokenStatus;

}
