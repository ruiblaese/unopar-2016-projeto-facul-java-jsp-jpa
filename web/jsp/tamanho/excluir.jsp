<%@page import="modelo.Tamanho"%>
<%@page import="jpa.EntityManagerUtil"%>
<%@page import="javax.persistence.EntityManager"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    EntityManager em;
    em = EntityManagerUtil.getEntityManager();
    if (!em.getTransaction().isActive()) {
        em.getTransaction().begin();
    }
    em.getTransaction().rollback();
    em.getTransaction().begin();

    Tamanho tamanho = em.find(Tamanho.class, id);
    String retorno = "erro";
    if (tamanho != null) {

        try {

            em.remove(tamanho);
            em.flush();
            em.getTransaction().commit();

            retorno = "success";
        } catch (Exception e) {
            retorno = "N�o foi possivel remover esse registro. (" + e.getMessage() + "\n" + e.getLocalizedMessage() + "\n" + e.toString() + ")";
            retorno = retorno.trim();
        } finally {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            em.close();
        }
    }
    out.print(retorno);
%>