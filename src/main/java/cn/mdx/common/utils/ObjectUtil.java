package cn.mdx.common.utils;

import org.apache.commons.beanutils.BeanUtils;

import lombok.SneakyThrows;



/**
 * 工具类的规范例子
 * 
 * 
 * @author 肖文杰
 * 
 */
public class ObjectUtil {

	@SneakyThrows
	public void copyAttribute(Object source, Object dest) throws Exception {
		org.springframework.beans.BeanUtils.copyProperties(source, dest);
	}
}
