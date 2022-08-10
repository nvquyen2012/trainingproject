package com.example.trainingbase.entity.auth;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "auth_user_action_log", schema = "auth_bib", catalog = "bib-auth-v1")
public class AuthUserActionLog {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "user_id")
    private int userId;
    @Basic
    @Column(name = "entity_id")
    private int entityId;
    @Basic
    @Column(name = "namespace")
    private Integer namespace;
    @Basic
    @Column(name = "prev_entity_value")
    private String prevEntityValue;
    @Basic
    @Column(name = "new_entity_value")
    private String newEntityValue;
    @Basic
    @Column(name = "user_ip")
    private String userIp;


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        AuthUserActionLog that = (AuthUserActionLog) o;
        return id == that.id && userId == that.userId && entityId == that.entityId && Objects.equals(namespace, that.namespace) && Objects.equals(prevEntityValue, that.prevEntityValue) && Objects.equals(newEntityValue, that.newEntityValue) && Objects.equals(userIp, that.userIp);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, entityId, namespace, prevEntityValue, newEntityValue, userIp);
    }
}
