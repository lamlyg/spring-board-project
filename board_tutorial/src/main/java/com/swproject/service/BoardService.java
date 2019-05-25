package com.swproject.service;

import java.util.List;

import com.swproject.domain.BoardVO;

public interface BoardService {

	public void register(BoardVO board);

	public BoardVO read(Long bno);

	public boolean modify(BoardVO board);

	public boolean remove(Long bno);

	public List<BoardVO> getList();
	
	//public BoardVO updateViewCnt(Long bno);
}
