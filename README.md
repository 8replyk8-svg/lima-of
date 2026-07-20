# LIMA - OF — Versión final (lista para GitHub)

## Archivos
- **index.html** — la app completa: pólizas + búsqueda + reportar pagos, con menú lateral, estadísticas en vivo, y exportación a Word.
- **apps-script-registros.gs** — código para el Sheet REAL de pólizas (ya apunta a "Copia de Clientes 2025").
- **apps-script-pagos.gs** — código para el Sheet aparte de pagos ("LIMA OF - Pagos").
- **INICIAR_LIMA_OF.bat** — para probarlo local con doble clic.

## Antes de subir a GitHub

1. **Verifica el Apps Script del Sheet real** — abre
   https://docs.google.com/spreadsheets/d/1W27qUgau9bWC6k_JsH_sGWQEbW4VYTnWdBDhZQW1u6c/edit
   → Extensiones → Apps Script → reemplaza todo con `apps-script-registros.gs` →
   Implementar → Gestionar implementaciones → ✏️ → Nueva versión → Implementar.

2. **El Sheet de Pagos ya está andando, no lo toques**:
   https://docs.google.com/spreadsheets/d/1h8kqHL0UFYpPhMCUBOwcNCgBXmOERd97qqVqWLyhFEQ/edit

3. Prueba `index.html` local con el `.bat` antes de subir, para confirmar que
   escribe en el Sheet correcto.

## Subir a GitHub

Copia `index.html` y `INICIAR_LIMA_OF.bat` dentro de tu carpeta `~/Documents/lima-of`
(la que clonaste de nuevo), reemplazando lo que haya. Luego:

```bash
git add .
git commit -m "Version completa: polizas + pagos + reportes"
git push
```

## Resumen de lo que hace el sistema

**Registro de pólizas**
- Sueltas el PDF (Positiva, Rimac, Mapfre, Interseguro) → autocompleta datos.
- Tipo Pago electrónico → aparece cuadro para adjuntar captura(s) + cuenta destino
  (Cuentas/BBVA/BCP) + placas extra si un pago cubre más de una póliza.
- "Enviar al Sheet" guarda todo junto: póliza + capturas.

**Buscar / Pendientes / Reportados** (menú lateral)
- Buscar: texto libre + filtro por aseguradora.
- Pendientes: pestañas "pendientes de pago" / "pendientes de reportar".
- Reportados: agrupado por fecha, con Póliza-Placa-Nombre-Aseguradora.

**Reportar pagos**
- Selecciona pendientes (con vista previa grande) → confirmación →
  genera PDF (imprimible) o Word (.docx, con salto de página por cuenta,
  cada foto en tabla independiente, imágenes sin distorsión).
- Marca reportado en el Sheet de Pagos y actualiza F/Reporte en la póliza.

**Editar pago** (desde Buscar): actualiza Tipo Pago/F Pago/N° Operación de una
póliza ya registrada, y permite adjuntar la captura ahí mismo si aplica.

**Actualización automática**: las estadísticas se refrescan solas cada 30s.
