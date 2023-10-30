package com.java.veggieats.restaurant.repository;

import com.java.veggieats.restaurant.dto.ReservationDTO;
import com.java.veggieats.restaurant.entity.ReservationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReservationRepository extends JpaRepository<ReservationEntity, String> {

    List<ReservationEntity> findAllByMemberId(String memberId);
    //
    @Query("SELECT new com.java.veggieats.restaurant.dto.ReservationDTO(a.reservationNo, a.people, a.state, b.restaurantName) " +
            "FROM reservation a INNER JOIN a.restaurant b " +
            "ON a.restaurant.restaurantId = b.restaurantId " +
            "WHERE a.memberId = :memberId")
    List<ReservationDTO> findReservation(@Param("memberId") String memberId);
}
