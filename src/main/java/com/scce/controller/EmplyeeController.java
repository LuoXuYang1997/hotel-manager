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
/*
*  接口文档访问地址：
*       http://localhost:8080/项目名/swagger-ui.html
*  swagger2 注解说明文档：
*       https://blog.csdn.net/weixin_41846320/article/details/82970204
*
*   @Api用于类上，说明该类的作用。可以标记一个Controller类做为swagger 文档资源
*   示例：@Api(value = "xxx", description = "xxx")
*         description	对api资源的描述
*   @ApiOperation用于方法上，说明方法的作用，每一个url资源的定义
*    示例：@ApiOperation(value = "xxx",httpMethod="POST", notes= "xxx",response=String.class)
*/
@RestController
@Api( description = "测试")
@RequestMapping("/emplyee")
public class EmplyeeController {
    @Autowired
    private EmplyeeService emplyeeService;

    @RequestMapping(value = "/login")
    @ApiOperation(value = "login接口", notes = "login接口" , httpMethod = "POST")
    /*@ApiImplicitParams({
            @ApiImplicitParam(name="id",required=false),
            @ApiImplicitParam(name="account",required=true),
            @ApiImplicitParam(name="realName",required=false),
            @ApiImplicitParam(name="password",required=false),
            @ApiImplicitParam(name="sex",required=false),
    })*/
    public JsonResult login(Emplyee emplyee){
        System.out.println("进入login方法");
        Emplyee emplyee1=emplyeeService.login(emplyee);
        System.out.println(emplyee);
        System.out.println(emplyee);
        if (emplyee!=null){
            return new JsonResult(0,null,"登陆成功");
        }else {
            return new JsonResult(1,null,"登陆失败，账号密码错误");
        }
    }
    //查询所有员工并分页
    @RequestMapping(value = "/getEmplyee")
    @ApiOperation(value = "hello接口", notes = "hello接口" , httpMethod = "POST")
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
