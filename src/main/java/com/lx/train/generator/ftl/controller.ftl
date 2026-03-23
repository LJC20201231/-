package com.lx.train.${module}.controller;

import context.common.train.com.lx.business.config.LoginMemberContext;
import com.lx.train.common.resp.CommonResp;
import com.lx.train.common.resp.PageResp;
import com.lx.train.${module}.req.${Domain}QueryReq;
import com.lx.train.${module}.req.${Domain}SaveReq;
import com.lx.train.${module}.resp.${Domain}QueryResp;
import com.lx.train.${module}.service.${Domain}Service;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/${do_main}")
public class ${Domain}Controller {
    @Autowired
    private ${Domain}Service ${domain}Service;

     /**
      * 新增接口
      * @param req
      * @return
      */
    @PostMapping("/save")
    public CommonResp<Object> save(@Valid @RequestBody ${Domain}SaveReq req) {
        ${domain}Service.save${Domain}(req);
        return new CommonResp<>();
    }

     /**
      * 查询接口
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
