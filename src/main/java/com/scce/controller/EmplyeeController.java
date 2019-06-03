package com.scce.controller;

import com.github.pagehelper.PageInfo;
import com.scce.pojo.Emplyee;
import com.scce.service.EmplyeeService;
import com.scce.utils.JsonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: IdeaProjects
 * @description:
 * @author: Lxy
 * @create: 2019-06-01 18:29
 **/
//http://localhost:8080/项目名/swagger-ui.html
@RestController
@Api( description = "测试")
public class EmplyeeController {
    @Autowired
    private EmplyeeService emplyeeService;

    //查询所有员工并分页
    @RequestMapping(value = "/getEmplyee")
    @ApiOperation(value = "hello接口", notes = "hello接口" , httpMethod = "GET")
    public JsonResult getEmplyee() throws Exception {
        System.out.println("执行查询所有员工的方法");
        PageInfo<Emplyee> pageInfo = emplyeeService.getEmplyee(1,5);
        System.out.println(pageInfo.getList());
        return  new JsonResult(pageInfo);
    }

    //根据id删除员工
    public JsonResult delEmplyee(){

        return new JsonResult();
    }

}
