import { Task } from './task';

let tasks: Task[] = [
  { id: 0, description: 'Learn Angular', completed: true },
  { id: 1, description: 'Learn TypeScript', completed: false },
  { id: 2, description: 'Learn Node.js', completed: false },
];

export enum TaskFilter {
  All = 'all',
  Active = 'active',
  Completed = 'completed'
}

export function getTasks(filter: TaskFilter = TaskFilter.All): Task[] {
  switch (filter) {
    case TaskFilter.Active:
      return tasks.filter(task => !task.completed);
    case TaskFilter.Completed:
      return tasks.filter(task => task.completed);
    default:
      return [...tasks];
  }
}

export function addTask(description: string) {
  const task = { id: tasks.length, description, completed: false };
  tasks.push(task);
}

export function setTaskCompleted(task: Task, completed: boolean) {
  task.completed = completed;
}
