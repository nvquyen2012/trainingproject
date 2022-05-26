package com.example.trainingbase.entity.auth;

import com.example.trainingbase.entity.AbstractEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;


@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "auth_company", schema = "auth_bib")
public class AuthCompany extends AbstractEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "address")
    private String address;
    @Basic
    @Column(name = "mng_fee_sharing")
    private BigDecimal mngFeeSharing;
    @Basic
    @Column(name = "transaction_fee_sharing")
    private BigDecimal transactionFeeSharing;
    @Basic
    @Column(name = "status")
    private String status;

    public AuthCompany(String name, String address, BigDecimal mngFeeSharing, BigDecimal transactionFeeSharing) {
        this.name = name;
        this.address = address;
        this.mngFeeSharing = mngFeeSharing;
        this.transactionFeeSharing = transactionFeeSharing;
    }
}
