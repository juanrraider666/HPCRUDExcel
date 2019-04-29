### 0.2.0 (21 Jul 2016)

 * Agregada funcionalidad de carga y visualizacion del soporte de la oportunidad al pasar a status ganada.
 * bugfix: se estaba usando un nombre de paquete de asset incorrecto *deal_support*
 * bugfix: corregido pulldown de acciones en el listado de oportunidades.
 * bugfix: corregido parametro de más en llamado a repositorio al generar excel.
 * Ajustado para que si la oportunidad está ganada no se pueda editar.
 * Cambiado el favico por el de optime.

### 0.2.1 - 0.2.2 (21 Jul 2016)

  * bugfix: Quitado filtro por empresa cuando el usuario es el approver.

### 0.2.2 - 0.3.0 (16 Ago 2016)

 * Creado comando para mostrar la informacion de los loyalties.
 * Ajustado el show de oportunidades para mostrar la info del approver correctamente.
 * Creada interfaz e implementacion de AuthorRepositoryInterface.
 * Creado SendMailListener para notificar a los usuarios cuando se crea un comentario.
 * Registradas las clases y listeners para la notificacion de comentarios como servicios.
 * Agregada informacion de los id del usuario, compañia, perfil, y usando el ExternalUserId y el ExternalCompanyId del Author del comentario.
 * Corregido bug que provocaba que los comentarios se cargaran dos veces.
 * Ajustado el js de comentarios para mostrar nuevos comentarios.
 * Ajustado el contador de comentarios.
 * Creado CommentNotifier.
 * Se quita la dependencia al Logger en SendMailListener.
 * Validando que si el submitter y el approver son el mismo, no se cree un recipient repetido.
 * Nuevos test creados y corregidos algunos existentes.
 * Ajustada la comparacion de ids en RecipientResolver.
 * Corregido bug en retorno del DealSoapClientFactory.

### 0.4.0 (15 Sept 2016)

 * Escuchando el evento de confirmación
 * Implementada logica de comparación en DealStatusPointMatcher
 * Capturando exceptions en DealStatusLogPointRelationSubscriber
 * Implementada logica de comparación en DealStatusPointMatcher
 * Agregado DealStatusLogRelationSubscriber
 * Creando clase para relacionar un log de status con los puntos generados.