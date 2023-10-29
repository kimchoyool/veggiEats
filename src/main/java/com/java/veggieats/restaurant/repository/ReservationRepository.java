package com.java.veggieats.restaurant.repository;

import com.java.veggieats.restaurant.entity.ReservationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReservationRepository extends JpaRepository<ReservationEntity, String> {

    List<ReservationEntity> findAllByMemberId(String memberId);
    @Query(value = "select a.reservationNo, a.people, a.state, b.restaurantName from reservation a inner join restaurant b where a.restaurant.restaurantId = b.restaurantId and a.memberId = :memberId")
    List<ReservationEntity> findReservation(@Param("memberId") String memberId);
}
