package ca.esystem.bridges.dao;

import org.springframework.stereotype.Repository;

import ca.esystem.framework.dao.BasicAccessDao;

/**
 * Dao Interface for Blog
 * 
 * @author cherie
 *
 */
@Repository
public interface BlogDao extends BasicAccessDao {
    public int updateStatus(Object obj);

}
