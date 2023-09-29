package com.java.veggieats.member.repository;

import com.java.veggieats.member.entity.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<MemberEntity, String> {
    MemberEntity findByMemberIdAndMemberPassword(String member_id, String member_password);

}
