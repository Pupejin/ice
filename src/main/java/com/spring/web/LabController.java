package com.spring.web;
import com.spring.domain.Lab;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/labs")
@Controller
@RooWebScaffold(path = "labs", formBackingObject = Lab.class)
public class LabController {
}
