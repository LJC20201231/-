package com.lx.train.${module}.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.util.ObjectUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lx.train.common.resp.PageResp;
import com.lx.train.common.util.SnowUtil;
import com.lx.train.${module}.domain.${Domain};
import com.lx.train.${module}.domain.${Domain}Example;
import com.lx.train.${module}.mapper.${Domain}Mapper;
import com.lx.train.${module}.req.${Domain}QueryReq;
import com.lx.train.${module}.req.${Domain}SaveReq;
import com.lx.train.${module}.resp.${Domain}QueryResp;
import jakarta.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Slf4j
@Service
public class ${Domain}Service {
    @Autowired
    ${Domain}Mapper ${domain}Mapper;

    /**
     * 新增和编辑操作
     * @param ${domain}SaveReq
     */
    public void save${Domain}(${Domain}SaveReq ${domain}SaveReq) {
        DateTime now = DateTime.now();
        ${Domain} ${domain} = BeanUtil.toBean(${domain}SaveReq, ${Domain}.class);
        if (${domain}.getId() == null) {
            //为空则完成新增操作
            ${domain}.setId(SnowUtil.getSnowflakeNextId());
            ${domain}.setCreateTime(now);
            ${domain}.setUpdateTime(now);
            ${domain}Mapper.insert(${domain});
        }else {
            //不为空则完成编辑操作
            ${domain}.setUpdateTime(now);
            ${domain}Mapper.updateByPrimaryKey(${domain});
        }
    }

    /**
     * 查询操作
     * @param req
     */
    public PageResp<${Domain}QueryResp> queryList(${Domain}QueryReq req) {
        ${Domain}Example ${domain}Example = new ${Domain}Example();
        ${Domain}Example.Criteria criteria = ${domain}Example.createCriteria();

        log.info("查询页码：{}", req.getPage());
        log.info("每页条数：{}", req.getSize());
        PageHelper.startPage(req.getPage(), req.getSize());
        List<${Domain}> ${domain}List = ${domain}Mapper.selectByExample(${domain}Example);

        PageInfo<${Domain}> pageInfo = new PageInfo<>(${domain}List);
        log.info("总行数：{}", pageInfo.getTotal());
        log.info("总页数：{}", pageInfo.getPages());

        List<${Domain}QueryResp> list = BeanUtil.copyToList(${domain}List, ${Domain}QueryResp.class);

        PageResp<${Domain}QueryResp> pageResp = new PageResp<>();
        pageResp.setTotal(pageInfo.getTotal());
        pageResp.setList(list);
        return pageResp;
    }

    /**
     * 删除操作
     * @param id
     */
    public void delete(Long id) {
        ${domain}Mapper.deleteByPrimaryKey(id);
    }
}
