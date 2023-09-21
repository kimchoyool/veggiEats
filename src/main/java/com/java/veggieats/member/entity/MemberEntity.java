package com.java.veggieats.member.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@NoArgsConstructor
@Entity(name="member")
@Getter
public class MemberEntity {
    @Id
    private String member_id;
    private String member_password;
    private String member_name;
    private String nickname;
    private String email;
    private String birthday;
    @CreationTimestamp
    private LocalDateTime create_date;

    @Builder
    public MemberEntity(String member_id, String member_password, String member_name, String nickname, String email, String birthday){
        this.member_id = member_id;
        this.member_password = member_password;
        this.member_name = member_name;
        this.nickname = nickname;
        this.email = email;
        this.birthday = birthday;
    }
}
