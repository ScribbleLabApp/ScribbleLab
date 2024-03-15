//
//  HomeView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 07.10.23.
//

import SwiftUI
import TipKit
import UserNotifications

struct HomeView: View {
    @StateObject var viewModifier = HomeViewModel()
    
    @State private var sortOption = DocumentSortOptionFavourite.date
    
    let createFirstDocumentTip = CreateNewDocumentTip()
    let showNotificationTip = ShowNotificationsTip()
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Spacer()
                
                SegmentedPicker(selection: $sortOption)
                    .padding(.horizontal)

                Spacer()
                
                HStack {
                    Button {
                        print("DEBUG: Select documents")
                    } label: {
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(.orange)
                    }
                    .padding(.horizontal)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "trash")
                    }
                    .padding(.horizontal)
                    
                    // FIXME: Fix display style logic
                    Menu {
                        Button {
                            
                        } label: {
                            Label("Symbols", systemImage: "square.grid.2x2")
                        }
                        Button {
                            
                        } label: {
                            Label("List", systemImage: "list.bullet")
                        }
                        Button {
                            
                        } label: {
                            Label("Column", systemImage: "rectangle.split.3x1")
                        }
                        
                        Divider()
                        
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Ascending", systemImage: "list.bullet")
                            }
                            Button {
                                
                            } label: {
                                Label("Descending", systemImage: "list.bullet")
                            }
                        } label: {
                            Label("Name", systemImage: "") // textformat.size
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Type", systemImage: "")
                        }
                        
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Ascending", systemImage: "list.bullet")
                            }
                            Button {
                                
                            } label: {
                                Label("Descending", systemImage: "list.bullet")
                            }
                        } label: {
                            Label("Date", systemImage: "")
                        }
                        
                        Menu {
                            Button {
                                
                            } label: {
                                Label("Ascending", systemImage: "list.bullet")
                            }
                            Button {
                                
                            } label: {
                                Label("Descending", systemImage: "list.bullet")
                            }
                        } label: {
                            Label("Size", systemImage: "")
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Tags", systemImage: "") // tag
                        }
                        
                        Divider()
                        
                        Menu {
                            Text("Group by:")
                                .font(.footnote)
                            
                            Button {
                                
                            } label: {
                                Label("None", systemImage: "") // tag
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Type", systemImage: "") // tag
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Date", systemImage: "") // tag
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Size", systemImage: "") // tag
                            }
                            
                            Button {
                                
                            } label: {
                                Label("Shared by", systemImage: "") // tag
                            }
                            
                            Divider()
                            
                            Button {
                                
                            } label: {
                                Label("Show all suffix", systemImage: "") // tag
                            }
                        } label: {
                            Label("Display options", systemImage: "")
                        }
                    } label: {
                        SLDisplayStyleButton(displayStyle: $viewModifier.displayStyle)
                            .padding(.horizontal) // line.3.horizontal.decrease.circle
                    }
                }
                .tint(.orange)
            }
            .padding()
            
            ContentUnavailableView("You have no documents", systemImage: "doc.viewfinder.fill")
        }
        .navigationTitle("Documents")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button {
                        viewModifier.showCreateNotebook.toggle()
                    } label: {
                        Label("Notebook", systemImage: "book.closed")
                    }
                    .sheet(isPresented: $viewModifier.showCreateNotebook) {
                        CreateNotebookView()
                            .navigationBarBackButtonHidden()
                    }
                    Button {
                        
                    } label: {
                        Label("Index cards", systemImage: "")
                    }
                    Button {
                        
                    } label: {
                        Label("Folder", systemImage: "folder")
                    }
                    Button {
                        
                    } label: {
                        Label("Scan Documents", systemImage: "doc.viewfinder")
                    }
                    Button {
                        
                    } label: {
                        Label("Take a picture", systemImage: "camera")
                    }
                    Button {
                        
                    } label: {
                        Label("Import", systemImage: "square.and.arrow.down")
                    }
                    Button {
                        
                    } label: {
                        Label("Quick note", systemImage: "square.and.pencil")
                    }
                } label: {
                    Button {
                        Task { await CreateNewDocumentTip.createNewDocumentEvent.donate() }
                        viewModifier.createDialogDisplayed.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .tint(.primary)
                    }
                    .popoverTip(createFirstDocumentTip)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    Task { /* TODO: Store tip */ }
                } label: {
                    Image(systemName: "storefront")
                        .tint(.primary)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModifier.notificationSheetisPresented.toggle()
                    Task {
                        await ShowNotificationsTip.visitNotificationViewEvent.donate()
                    }
                    viewModifier.newNotification.toggle()
                } label: {
                    Image(systemName: viewModifier.newNotification ? "bell.badge" : "bell")
                        .tint(.primary)
                }
                .popoverTip(showNotificationTip)
                .sheet(isPresented: $viewModifier.notificationSheetisPresented, content: {
                    NotificationSheetView()
                        .presentationDragIndicator(.visible)
                })
            }
            
            // FIXME: TODO: Show Settings sheet
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModifier.settingsViewSheetisPresented.toggle()
                } label: {
                    Image(systemName: "gearshape")
                        .tint(.primary)
                }
                .sheet(isPresented: $viewModifier.settingsViewSheetisPresented, content: {
//                    SLSettingsView()
                    SettingsView()
                        .environmentObject(AppDelegate())
                })
            }
        }
//        .tint(.primary)
        .onAppear {
            Task {
                await CreateNewDocumentTip.launchHomeScreenEvent.donate()
                await ShowNotificationsTip.launchHomeScreenEvent.donate()
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeView()
            .task {
//                try? Tips.resetDatastore()
                try? Tips.configure([
                    .datastoreLocation(.applicationDefault)
                ])
            }
    }
}
