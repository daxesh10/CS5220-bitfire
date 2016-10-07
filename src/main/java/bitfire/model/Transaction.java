package bitfire.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="transactions")
public class Transaction implements Serializable{

	private static final long serialVersionUID = 1L;

}
