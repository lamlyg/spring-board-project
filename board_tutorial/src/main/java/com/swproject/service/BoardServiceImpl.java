package com.swproject.service;

import java.util.List;

import javax.xml.stream.events.Namespace;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;

import com.swproject.domain.BoardVO;
import com.swproject.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register......"+board);

		mapper.insertSelectKey(board);
	}
	@Override
	public BoardVO read(Long bno) {
		log.info("get...."+bno);
		mapper.updateViewCnt(bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify...."+board);
		
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove...."+bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<BoardVO> getList(){
		log.info("getList....");
		return mapper.getList();
	}
	
	@Override
	public List<BoardVO> searchList(String word){
		return mapper.search(word);
	}
//	@Override
//	public BoardVO updateViewCnt(Long bno) {
//		mapper.updateViewCnt(bno);
//		return mapper.read(bno);
//	}
}

