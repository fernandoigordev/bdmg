unit Types.Task;

interface

type
  TTaskStatus = (tsNone, tsPending, tsRunning, tsCompleted);
  TTaskPriority = (tpNone, tpLow, tpNormal, tpHigh);

  const TTaskStatusDescription: array[TTaskStatus] of String = ('', 'Pendente', 'Em execução', 'Concluído');
  const TTaskPriorityDescription: array[TTaskPriority] of String = ('', 'Baixa', 'Normal', 'Alta');
implementation

end.
