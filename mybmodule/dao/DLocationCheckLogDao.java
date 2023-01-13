package .dao;

import .entity.DLocationCheckLog;
import org.apache.ibatis.annotations.Param;
import org.springframework.data.domain.Pageable;
import java.util.List;

/**
 * 设备定位验证日志表(DLocationCheckLog)表数据库访问层
 *
 * @author makejava
 * @since 2022-12-23 11:16:32
 */
public interface DLocationCheckLogDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    DLocationCheckLog queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param dLocationCheckLog 查询条件
     * @param pageable         分页对象
     * @return 对象列表
     */
    List<DLocationCheckLog> queryAllByLimit(DLocationCheckLog dLocationCheckLog, @Param("pageable") Pageable pageable);

    /**
     * 统计总行数
     *
     * @param dLocationCheckLog 查询条件
     * @return 总行数
     */
    long count(DLocationCheckLog dLocationCheckLog);

    /**
     * 新增数据
     *
     * @param dLocationCheckLog 实例对象
     * @return 影响行数
     */
    int insert(DLocationCheckLog dLocationCheckLog);

    /**
     * 批量新增数据（MyBatis原生foreach方法）
     *
     * @param entities List<DLocationCheckLog> 实例对象列表
     * @return 影响行数
     */
    int insertBatch(@Param("entities") List<DLocationCheckLog> entities);

    /**
     * 批量新增或按主键更新数据（MyBatis原生foreach方法）
     *
     * @param entities List<DLocationCheckLog> 实例对象列表
     * @return 影响行数
     * @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
     */
    int insertOrUpdateBatch(@Param("entities") List<DLocationCheckLog> entities);

    /**
     * 修改数据
     *
     * @param dLocationCheckLog 实例对象
     * @return 影响行数
     */
    int update(DLocationCheckLog dLocationCheckLog);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

}

