
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Advertisement;

@Repository
public interface AdvertisementRepository extends JpaRepository<Advertisement, Integer> {

	//Me devuelve los anuncios con alguna palabra tabu en el título
	@Query("select a from Advertisement a where a.title like %?1%")
	Collection<Advertisement> findAdvertisementWithTabooWord(String tabooWord);

}
