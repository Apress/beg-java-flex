package com.apress.usermanager.model;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;


@Entity
@Table(name = "users")
@NamedQueries( { @NamedQuery(name = User.DELETE_BY_EMAIL, query = "delete from User u where u.email = :email"),
				 @NamedQuery(name = User.FIND_BY_USERNAME, query = "from User u where u.username = :username") })
public class User {

	@Id
	@Column(name="user_id",unique=true, nullable=false )
	@GeneratedValue( strategy = IDENTITY )
	private long userId;

	@Column(unique=true, nullable=false )
	private String username;

	@Column
	private String password;

	@Column
	private int enabled;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private List<Authority> authorities;

	@Column(name="common_name")
	private String commonName;

	@Column(name="last_name")
	private String lastName;

	@Column(name="email",unique=true, nullable=false )
	private String email;

	public static final String DELETE_BY_EMAIL = "User.deleteByEmail";

	public static final String FIND_BY_USERNAME = "User.findByUsername";

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public List<Authority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(List<Authority> authorities) {
		this.authorities = authorities;
	}

	public String getCommonName() {
		return commonName;
	}

	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
