/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testes;

import javax.persistence.EntityManager;
import jpa.EntityManagerUtil;
import modelo.Cliente;
import modelo.Empresa;
import modelo.Entregador;
import modelo.Pedido;
import modelo.Produto;
import modelo.SituacaoPedido;
import modelo.PedidoItem;
import modelo.Tamanho;

/**
 *
 * @author RUIBL
 */
public class TestePrincipal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        EntityManager em;
        em = EntityManagerUtil.getEntityManager();

        Cliente cliente = new Cliente();
        cliente.setNome("rui");
        cliente.setTelefone("47 88180000");
        cliente.setEndereco("rua tocantins");
        cliente.setPonto_referencia("aqui");
        //cliente.setNascimento(null);
        em.getTransaction().begin();
        em.persist(cliente);
        em.getTransaction().commit();

        Empresa empresa = new Empresa();
        empresa.setNome("empresa1");
        empresa.setCnpj("000.000.000-00");
        empresa.setEndereco("endereco");
        empresa.setTelefone("35217912");
        empresa.setEmail("rui@ibs.inf.br");

        em.getTransaction().begin();
        em.persist(empresa);
        em.getTransaction().commit();

        Entregador entregador = new Entregador();
        entregador.setNome("entregador1");
        entregador.setCpf("000.000.000-00");
        entregador.setRg("0.000.000");
        entregador.setCelular("nokia");
        entregador.setEmpresa(empresa);
        em.getTransaction().begin();
        em.persist(entregador);
        em.getTransaction().commit();

        Tamanho tamanho;

        tamanho = new Tamanho();
        tamanho.setDescricao("pequena");
        em.getTransaction().begin();
        em.persist(tamanho);
        em.getTransaction().commit();

        tamanho = new Tamanho();
        tamanho.setDescricao("media");
        em.getTransaction().begin();
        em.persist(tamanho);
        em.getTransaction().commit();

        tamanho = new Tamanho();
        tamanho.setDescricao("grande");
        em.getTransaction().begin();
        em.persist(tamanho);
        em.getTransaction().commit();

        tamanho = em.find(Tamanho.class, 2);

        Produto produto = new Produto();
        produto.setNome("marmita1");
        produto.setDescricao("Arroz, feijão, bife e salada de tomate");
        produto.setPreco(20.1);
        produto.setTamanho(tamanho);
        em.getTransaction().begin();
        em.persist(produto);
        em.getTransaction().commit();

        SituacaoPedido situacaoPedido = new SituacaoPedido();
        situacaoPedido.setDescricao("Pendente");
        em.getTransaction().begin();
        em.persist(situacaoPedido);
        em.getTransaction().commit();

        Pedido pedido = new Pedido();
        pedido.setCliente(cliente);
        pedido.setEntregador(entregador);
        pedido.setSituacaoPedido(situacaoPedido);
        pedido.setSub_total(0.00);
        pedido.setTotal(0.00);

        em.getTransaction().begin();
        em.persist(pedido);
        em.getTransaction().commit();

        PedidoItem itemPedido = new PedidoItem();
        itemPedido.setPedido(pedido);
        itemPedido.setProduto(produto);
        itemPedido.setQuantidade(1.00);
        itemPedido.setValorUnitario(0.00);
        itemPedido.setValorTotal(0.00);

        em.getTransaction().begin();
        em.persist(itemPedido);
        em.getTransaction().commit();

    }

}
