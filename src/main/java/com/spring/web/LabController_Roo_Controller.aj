// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.spring.web;

import com.spring.domain.Customer;
import com.spring.domain.Lab;
import com.spring.web.LabController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect LabController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String LabController.create(@Valid Lab lab, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lab);
            return "labs/create";
        }
        uiModel.asMap().clear();
        lab.persist();
        return "redirect:/labs/" + encodeUrlPathSegment(lab.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String LabController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Lab());
        return "labs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String LabController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("lab", Lab.findLab(id));
        uiModel.addAttribute("itemId", id);
        return "labs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String LabController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("labs", Lab.findLabEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Lab.countLabs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("labs", Lab.findAllLabs(sortFieldName, sortOrder));
        }
        return "labs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String LabController.update(@Valid Lab lab, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, lab);
            return "labs/update";
        }
        uiModel.asMap().clear();
        lab.merge();
        return "redirect:/labs/" + encodeUrlPathSegment(lab.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String LabController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Lab.findLab(id));
        return "labs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String LabController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Lab lab = Lab.findLab(id);
        lab.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/labs";
    }
    
    void LabController.populateEditForm(Model uiModel, Lab lab) {
        uiModel.addAttribute("lab", lab);
        uiModel.addAttribute("customers", Customer.findAllCustomers());
    }
    
    String LabController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
