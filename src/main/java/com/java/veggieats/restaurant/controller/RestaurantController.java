package com.java.veggieats.restaurant.controller;

import com.java.veggieats.restaurant.entity.ReservationEntity;
import com.java.veggieats.restaurant.repository.ReservationRepository;
import com.java.veggieats.restaurant.repository.RestaurantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.LocalTime;

@Controller
@RequiredArgsConstructor
public class RestaurantController {
    private final ReservationRepository reservationRepository;
    //private final RestaurantRepository restaurantRepository;
    @GetMapping(value = "/restaurant")
    public String getRestaurant(){

        return "shop_page";
    }

    @PostMapping(value = "/reservation")
    public String postReservation(HttpServletRequest request, HttpSession session, Model model){
        ReservationEntity reservation = ReservationEntity.builder()
                .reservationNo(LocalDate.now().toString().replace("-","")+LocalTime.now().toString().substring(0,7))
                .memberId((String) session.getAttribute("ID"))
                .restaurantId("veggieats") //임시식당정보
                .reservationDate(LocalDate.parse(request.getParameter("Reservation_date")))
                .reservationTime(request.getParameter("Reservation_time"))
                .people(Integer.parseInt(request.getParameter("people")))
                .deposit(Integer.parseInt(request.getParameter("deposit").replace(",","")))
                .build();
        ReservationEntity reservationEntity = reservationRepository.save(reservation);
        model.addAttribute("reservation", reservationEntity);
        return "reservation_check";
    }

    @GetMapping(value = "/reservationInfo")
    public String getReservationInfo(HttpServletRequest request, Model model){
        model.addAttribute("reservation", reservationRepository.findById(request.getParameter("no")));
        return "my_reservationInfo";
    }

    @Transactional
    @PostMapping(value = "/reservationInfo")
    public String postReservationInfoCancel(HttpServletRequest request){
        ReservationEntity reservation = reservationRepository.findById(request.getParameter("no"))
            .orElseThrow(IllegalArgumentException::new);
        reservation.setState("예약취소");

        return "redirect:myReservation";
    }
}
