
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Animal;
import domain.Offer;

@Repository
public interface OfferRepository extends JpaRepository<Offer, Integer> {

	@Query("select o from Offer o where o.isAccepted = true and o.request.id = ?1")
	public Offer findAcceptedOffer(int requestId);

	@Query("select o from Offer o where o.isAccepted = false and o.request.id = ?1")
	public Collection<Offer> findNonAcceptedOffers(int requestId);

	@Query("select o from Offer o where o.request.id = ?1")
	public Collection<Offer> findOfferByRequestId(int requestId);

	@Query("select o from Offer o where o.isAccepted = true and o.request.customer.id = ?1")
	public Collection<Offer> findAcceptedOffersByCustomer(int customerId);

	@Query("select o.animal from Offer o where o.isAccepted = true")
	public Collection<Animal> findOfferAccept();
}
