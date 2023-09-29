package com.java.veggieats.board.repository;

import com.java.veggieats.board.entity.BoardEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BoardRepository extends JpaRepository<BoardEntity, Long> {
    List<BoardEntity> findAllByMemberId(String memberId);
}
