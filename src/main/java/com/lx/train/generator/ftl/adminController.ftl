package com.lx.train.${module}.controller.admin;


import com.lx.train.common.resp.CommonResp;
import com.lx.train.common.resp.PageResp;
import com.lx.train.${module}.req.${Domain}QueryReq;
import com.lx.train.${module}.req.${Domain}SaveReq;
import com.lx.train.${module}.resp.${Domain}QueryResp;
import com.lx.train.${module}.service.${Domain}Service;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;

@RestController
@RequestMapping("/admin/${do_main}")
public class ${Domain}AdminController {
    @Autowired
    private ${Domain}Service ${domain}Service;

     /**
      * 新增乘客接口
      * @param req
      * @return
      */
    @PostMapping("/save")
    public CommonResp<Object> save(@Valid @RequestBody ${Domain}SaveReq req) {
        ${domain}Service.save${Domain}(req);
        return new CommonResp<>();
    }

     /**
      * 乘客查询接口
      * @param req
      * @return
      */
     @GetMapping("/query-list")
     public CommonResp<PageResp<${Domain}QueryResp>> queryList(@Valid ${Domain}QueryReq req) {
         PageResp<${Domain}QueryResp> list = ${domain}Service.queryList(req);
         return new CommonResp<>(list);
     }

     @DeleteMapping("/delete/{id}")
     public CommonResp<Object> delete(@PathVariable Long id) {
         ${domain}Service.delete(id);
         return new CommonResp<>();
     }
}
