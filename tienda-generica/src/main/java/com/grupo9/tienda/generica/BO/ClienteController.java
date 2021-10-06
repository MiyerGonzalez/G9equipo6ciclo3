package com.grupo9.tienda.generica.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo9.tienda.generica.DAO.ClienteDAO;
import com.grupo9.tienda.generica.DTO.ClienteVO;
@RestController
public class ClienteController {
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarcliente")
	public void registrarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.registrarCliente(user);
	}

	@GetMapping("/consultarcliente")
	public ArrayList<ClienteVO> consultarClientes(String cedula_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.consultarCliente(cedula_cliente);
	}

	@GetMapping("/listaclientes")
	public ArrayList<ClienteVO> listaDeClientes() {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.listaDeClientes();
	}
	
	@DeleteMapping("/eliminarcliente")
	public void eliminarCliente(Integer cedula_cliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarCliente(cedula_cliente);
	}
	
	@PutMapping("/actualizarclientes")
	public void actualizarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.actualizarCliente(user);
	}

}
