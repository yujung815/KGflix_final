package com.company.kgflix.vo;

import lombok.ToString;

@ToString
public class FavoritesFreeVO {
	public static int free;
	public static int con_no;

	public static int getFree() {
		return free;
	}

	public static void setFree(int free) {
		FavoritesFreeVO.free = free;
	}

	public static int getCon_no() {
		return con_no;
	}

	public static void setCon_no(int con_no) {
		FavoritesFreeVO.con_no = con_no;
	}

}
