package com.example.trainingbase.entity.crm;

import com.example.trainingbase.entity.AbstractEntity;
import com.example.trainingbase.entity.auth.EStatus;
import com.example.trainingbase.entity.crm.enums.ApprovalType;
import com.example.trainingbase.entity.crm.enums.InstructionType;
import lombok.*;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.math.BigInteger;
import java.time.LocalDateTime;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Table(name = "instruction", schema = "crm_bib")
public class Instruction extends AbstractEntity {
    @Id
    @Column(name = "id", unique = true, nullable = false, length = 36)
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    private String id;

    private String investorId;

    @Enumerated(EnumType.STRING)
    private InstructionType instructionType;

    private String productId;
    private BigInteger numberOfUnit;
    private String switchOutProductId;
    private String switchInProductId;
    private BigInteger amountCcy;
    private Double fee;
    private LocalDateTime transactionDate;

    @Enumerated(EnumType.STRING)
    private ApprovalType approvalType;
    private String attachFile;
    private String investorType;
    @Enumerated(EnumType.STRING)
    private EStatus status;
    private String signatureSecond;
}
