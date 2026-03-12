CREATE PROCEDURE SP_ControlTickets
AS
BEGIN
    DECLARE @ticketsHoy INT;

    SELECT @ticketsHoy = COUNT(*)
    FROM Tickets
    WHERE CAST(fecha_creacion AS DATE) = CAST(GETDATE() AS DATE);

    IF @ticketsHoy >= 5
        RETURN 0;  -- No se puede insertar
    ELSE
        RETURN 1;  -- Sí se puede insertar
END

