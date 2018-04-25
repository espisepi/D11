
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Newspaper;
import domain.Volume;

@Repository
public interface VolumeRepository extends JpaRepository<Volume, Integer> {

	@Query("select u.volumes from User u where u.id=?1")
	Collection<Volume> myVolumes(int idUser);
	//seleccionar las newspapers de un  volumen
	@Query("select v.newspapers from Volume v where v.id=?1")
	Collection<Newspaper> volumesNewspaper(int volumenid);

}
