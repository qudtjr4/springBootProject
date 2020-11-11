package com.csis3275.dao_riphumiTest;

import static org.assertj.core.api.Assertions.assertThatObject;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import com.csis3275.dao_riphumi.FolderDAOImpl_riphumi;

class FolderDAOImpl_riphumiTest {
	
	FolderDAOImpl_riphumi dao;

	@Test
	void getFoldeByID() {
		assertThatObject(dao.getFolderById(1));
	}

}
