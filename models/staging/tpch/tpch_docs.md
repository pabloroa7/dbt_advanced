{% docs order_status_code %}

Estado actual del pedido. Los valores posibles son:

| Código | Estado (Inglés) | Definición en Español                                       |
|--------|-----------------|-------------------------------------------------------------|
| **O**  | Open            | El pedido está abierto y tiene líneas pendientes de envío.  |
| **F**  | Filled          | El pedido ha sido completado y enviado en su totalidad.     |
| **P**  | Partial         | El pedido tiene algunas líneas enviadas y otras pendientes. |

{% enddocs %}

{% docs return_flag_code %}

Indicador de devolución de la línea de pedido. Clasifica el estado logístico del artículo:

| Código | Estado (Inglés) | Definición en Español                           |
|--------|-----------------|-------------------------------------------------|
| **N**  | Normal          | Venta normal, sin devolución.                   |
| **R**  | Returned        | El cliente ha devuelto el artículo.             |
| **A**  | Awaiting        | Esperando devolución o reingreso al inventario. |

{% enddocs %}

{% docs line_status_code %}

Estado de la línea individual dentro del pedido:

| Código | Estado | Definición                        |
|--------|--------|-----------------------------------|
| **O**  | Open   | La línea está pendiente de envío. |
| **F**  | Filled | La línea ha sido enviada.         |

{% enddocs %}