package com.example.trainingbase.entity.new_auth;

import com.example.trainingbase.entity.AbstractEntity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.ArrayList;
import java.util.Collection;

@Data
@Entity
@Table(name = "user", uniqueConstraints = {@UniqueConstraint(columnNames = "username"),
        @UniqueConstraint(columnNames = "email")})
@Inheritance(strategy = InheritanceType.JOINED)
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"createdAt", "updatedAt"}, allowGetters = true)
public class User extends AbstractEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "username")
    @NotBlank
    @Size(min = 2, max = 20)
    private String username;

    @JsonIgnoreProperties
    @Column(name = "password")
    @Size(min = 6, max = 120)
    private String password;

    @Column(name = "phone")
    @NotBlank
    @Size(min = 10, max = 10)
    private String phone;

    @Column(name = "fullname", length = 50)
    @NotBlank
    @Size(min = 5, max = 50)
    private String fullname;

    @Column(name = "email")
    @NotBlank
    @Size(min = 5, max = 50)
    @Email
    private String email;

    @Column(name = "address")
    @NotBlank
    @Size(min = 5, max = 200)
    private String address;

    @Size(min = 5, max = 200)
    @JoinColumn(name = "profile_image_path")
    private String profileImagePath;

    // EnumUserStatus
    @Column(name = "status")
    @NotBlank
    @Size(min = 2, max = 20)
    private String status;

    @JsonIgnoreProperties
    @ManyToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST}, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Collection<Role> roles = new ArrayList<>();

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((id == null) ? 0 : id.hashCode());
        result = prime * result + ((username == null) ? 0 : username.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        User other = (User) obj;
        if (id == null) {
            if (other.id != null)
                return false;
        } else if (!id.equals(other.id))
            return false;
        if (username == null) {
            if (other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        return true;
    }

}
