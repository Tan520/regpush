package com.touchstonesoft.regpush.controller;

import com.touchstonesoft.regpush.pojo.RegInfo;
import com.touchstonesoft.regpush.service.RegService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Base64;

@RestController
@RequestMapping("/reg")
public class RegController {

	final Base64.Decoder decoder= Base64.getDecoder();
    final Base64.Encoder encoder= Base64.getEncoder();
    private RegService regService;

    private static Logger logger = LoggerFactory.getLogger(RegController.class);

    @Autowired
    public RegController(RegService regService) {
        this.regService = regService;
    }

    @RequestMapping(method = RequestMethod.GET)
    public void saveRegInfo(RegInfo regInfo, HttpServletRequest request) {
        try {
			String CDEVICETYPENAME=regInfo.getCDEVICETYPENAME().replaceAll(" +","+");
			CDEVICETYPENAME= new String(decoder.decode(CDEVICETYPENAME), "GBK");

			String CDEVICENAME=regInfo.getCDEVICENAME().replaceAll(" +","+");
            CDEVICENAME= new String(decoder.decode(CDEVICENAME), "GBK");

            regInfo.setCDEVICETYPENAME(CDEVICETYPENAME);
            regInfo.setCDEVICENAME(CDEVICENAME);
            boolean flag = regService.addRegInfo(regInfo);
            logger.info("反馈回临床结果：{}，该条信息为：{}?{}",flag,request.getRequestURL(),request.getQueryString());
        } catch (Exception e) {
            logger.error("回写数据错误，该条信息为：{}?{}，错误信息：\n", request.getRequestURL(),request.getQueryString(), e);
        }
    }

    @ExceptionHandler(Exception.class)
    public void handleException(Exception e, HttpServletRequest request) {
        logger.error("其它错误，该条信息为：{}?{}，错误信息：\n", request.getRequestURL(),request.getQueryString(), e);
        e.printStackTrace();
    }
}
