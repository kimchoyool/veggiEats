package com.java.veggieats.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.java.veggieats")
public class CommonExceptionHandler {

    @ExceptionHandler(ArithmeticException.class)
    public ModelAndView handlerArithmeticException(Exception e) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("exception",e); //해당 예외 객체
        //예외처리를 보여줄 페이지 경로 뷰 리졸버의 영향을 받아서 .jsp는 안씀
        mav.setViewName("/common/arithmeticError");

        return mav;
    }

    @ExceptionHandler(NullPointerException.class)
    public ModelAndView handlerNullpointerException(Exception e) throws Exception {

        ModelAndView mav = new ModelAndView();

        mav.addObject("exception",e); //해당 예외 객체
        mav.setViewName("/common/nullpointerError");//예외처리를 보여줄 페이지 경로

        return mav;
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handlerException(Exception e) {

        ModelAndView mav = new ModelAndView();
        mav.addObject("exception", e);
        mav.setViewName("/common/error");

        return mav;
    }
}
