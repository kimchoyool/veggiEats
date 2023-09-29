package com.java.veggieats.member.entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDateTime;

@NoArgsConstructor
@Entity(name="member")
@Getter
@DynamicUpdate
public class MemberEntity {
    @Id
    @Column(name = "member_id")
    private String memberId;
    @Setter
    @Column(name = "member_password")
    private String memberPassword;
    @Column(name = "member_name")
    private String memberName;
    @Setter
    private String nickname;
    @Setter
    private String email;
    private String birthday;
    @CreationTimestamp
    @Column(name = "create_date")
    private LocalDateTime createDate;

    @Builder
    public MemberEntity(String memberId, String memberPassword, String memberName, String nickname, String email, String birthday){
        this.memberId = memberId;
        this.memberPassword = memberPassword;
        this.memberName = memberName;
        this.nickname = nickname;
        this.email = email;
        this.birthday = birthday;
    }

}
