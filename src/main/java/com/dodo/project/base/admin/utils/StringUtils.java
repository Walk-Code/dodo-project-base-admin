package com.dodo.project.base.admin.utils;

import java.util.stream.Collectors;
import java.util.stream.IntStream;

/**
 * 常用字符操作辅助函数
 */
public class StringUtils {

	/**
	 * 将一个字符重复times次显示
	 *
	 * @param s
	 * @param times
	 * @return
	 */
	public static String repeat(String s, int times) {
		String sRepeated = IntStream.range(0, times).mapToObj(i -> s).collect(Collectors.joining(""));

		return sRepeated;
	}


}
