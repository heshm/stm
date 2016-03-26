package com.erp.common.util;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

public class CommonUtil {

	public static String getFirstDayOfTheMonth() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		GregorianCalendar gregorianCalendar = (GregorianCalendar) Calendar.getInstance();
		gregorianCalendar.setTime(date);
		gregorianCalendar.set(Calendar.DAY_OF_MONTH, 1);
		date = gregorianCalendar.getTime();
		return format.format(date);

	}

	public static String getCurrentDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		return format.format(date);

	}

	public static String getCurrentDate(String fmt) {
		SimpleDateFormat format = new SimpleDateFormat(fmt);
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		return format.format(date);

	}

	public static String getLastDay() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date theDate = calendar.getTime();
		String s = df.format(theDate);
		StringBuffer str = new StringBuffer().append(s).append(" 23:59:59");
		return str.toString();

	}

	public static String dateFormat(Date date, String format) {
		SimpleDateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}

	public static String getNextSeqNo(String seqNo, int length) {
		int nextNo = Integer.parseInt(seqNo);
		nextNo++;
		seqNo = "" + nextNo;
		for (int i = seqNo.length(); i < length; i++) {
			seqNo = "0" + seqNo;
		}
		seqNo = StringUtils.leftPad(seqNo, length);
		return seqNo;
	}

	public static String getNextRKSeqNo(String rKseqNo) {

		String current = rKseqNo.substring(10, 14);
		String next = getNextSeqNo(current, 4);
		rKseqNo = rKseqNo.substring(0, 10);
		rKseqNo = rKseqNo + next;
		// System.out.println(current);
		return rKseqNo;
	}

	public static String getNextCKSeqNo(String CKseqNo) {
		String current = CKseqNo.substring(10, 14);
		String next = getNextSeqNo(current, 4);
		CKseqNo = CKseqNo.substring(0, 10);
		CKseqNo = CKseqNo + next;
		// System.out.println(current);
		return CKseqNo;
	}

	public static String dataFormat(String str) {
		if (str.length() <= 10) {
			return str;
		} else {
			return str.substring(0, 10);
		}
	}

	public static String digitUppercase(BigDecimal bigDecimal) {
		String fraction[] = { "角", "分" };
		String digit[] = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
		/**
		 * 仟 佰 拾 ' ' ' ' $4 $3 $2 $1 万 $8 $7 $6 $5 亿 $12 $11 $10 $9
		 */
		String unit1[] = { "", "拾", "佰", "仟" };// 把钱数分成段,每四个一段,实际上得到的是一个二维数组
		String unit2[] = { "元", "万", "亿", "万亿" }; // 把钱数分成段,每四个一段,实际上得到的是一个二维数组
		//BigDecimal bigDecimal = new BigDecimal(num);
		bigDecimal = bigDecimal.multiply(new BigDecimal(100));
		// Double bigDecimal = new Double(name*100); 存在精度问题 eg：145296.8
		String strVal = String.valueOf(bigDecimal.toBigInteger());
		String head = strVal.substring(0, strVal.length() - 2); // 整数部分
		String end = strVal.substring(strVal.length() - 2); // 小数部分
		String endMoney = "";
		String headMoney = "";
		if ("00".equals(end)) {
			endMoney = "整";
		} else {
			if (!end.substring(0, 1).equals("0")) {
				endMoney += digit[Integer.valueOf(end.substring(0, 1))] + "角";
			} else if (end.substring(0, 1).equals("0") && !end.substring(1, 2).equals("0")) {
				endMoney += "零";
			}
			if (!end.substring(1, 2).equals("0")) {
				endMoney += digit[Integer.valueOf(end.substring(1, 2))] + "分";
			}
		}
		char[] chars = head.toCharArray();
		Map<String, Boolean> map = new HashMap<String, Boolean>();// 段位置是否已出现zero
		boolean zeroKeepFlag = false;// 0连续出现标志
		int vidxtemp = 0;
		for (int i = 0; i < chars.length; i++) {
			int idx = (chars.length - 1 - i) % 4;// 段内位置 unit1
			int vidx = (chars.length - 1 - i) / 4;// 段位置 unit2
			String s = digit[Integer.valueOf(String.valueOf(chars[i]))];
			if (!"零".equals(s)) {
				headMoney += s + unit1[idx] + unit2[vidx];
				zeroKeepFlag = false;
			} else if (i == chars.length - 1 || map.get("zero" + vidx) != null) {
				headMoney += "";
			} else {
				headMoney += s;
				zeroKeepFlag = true;
				map.put("zero" + vidx, true);// 该段位已经出现0；
			}
			if (vidxtemp != vidx || i == chars.length - 1) {
				headMoney = headMoney.replaceAll(unit2[vidx], "");
				headMoney += unit2[vidx];
			}
			if (zeroKeepFlag && (chars.length - 1 - i) % 4 == 0) {
				headMoney = headMoney.replaceAll("零", "");
			}
		}
		return headMoney + endMoney;
	}

	public static void main(String[] args) throws Exception {

		System.out.println(digitUppercase(new BigDecimal("3534543.00")));
	}

}
