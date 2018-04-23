
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import domain.Underwrite;

@Repository
public interface UnderwriteRepository extends JpaRepository<Underwrite, Integer> {

}
